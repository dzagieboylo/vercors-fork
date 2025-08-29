#ifndef CUDA_EXT_H
#define CUDA_EXT_H
#define MATH_H  //also define math since these headers are incompatible

#define M_PI           3.14159265358979323846  /* pi */
#define FLT_MAX 3.40282346638528859812e+38F

const double NAN = vercorsNAN;
const double INFINITY = vercorsINFINITY;

/*@
  decreases;
pure double M_PI() = 3.14159265358979323846;
@*/

/*@
  ensures \result == powf(2.7182818284, x);
  decreases;
@*/
/*@ pure @*/ float expf(float x);


/*@
  requires x >= -1 && x <= 1;
  ensures \result >= 0 && \result <= M_PI();
  decreases;
@*/
/*@ pure @*/ float acosf(float x);
/*@ pure @*/ float acoshf(float x);
/*@
  requires x >= -1 && x <= 1;
  ensures \result >= -M_PI()/2 && \result <= M_PI()/2;
  decreases;
@*/
/*@ pure @*/ float asinf(float x);
/*@ pure @*/ float asinhf(float x);
/*@
  ensures -M_PI() <= \result && \result <= M_PI();
  decreases;
@*/
/*@ pure @*/ float atan2f(float y, float x);
/*@
  ensures \result >= -M_PI()/2 && \result <= M_PI()/2;
  decreases;
@*/
/*@ pure @*/ float atanf(float x);
/*@ pure @*/ float atanhf(float x);
/*@ pure @*/ float cbrtf(float x);
/*@
  ensures \result == (\is_int(x) ? x : (float)((int)x + 1));
  decreases;
@*/
/*@ pure @*/ float ceilf(float x);
/*@ pure @*/ float copysignf(float x, float y);
/*@
  ensures \result >= -1 && \result <= 1;
  decreases;
@*/
/*@ pure @*/ float cosf(float x);
/*@
  ensures \result == (expf(x) + expf(-x)) \ 2;
  decreases;
@*/
/*@ pure @*/ float coshf(float x);
/*@ pure @*/ float cospif(float x);
/*@ pure @*/ float cyl_bessel_i0f(float x);
/*@ pure @*/ float cyl_bessel_i1f(float x);
/*@ pure @*/ float erfcf(float x);
/*@ pure @*/ float erfcinvf(float x);
/*@ pure @*/ float erfcxf(float x);
/*@ pure @*/ float erff(float x);
/*@ pure @*/ float erfinvf(float x);
/*@ pure @*/ float exp10f(float x);
/*@ pure @*/ float exp2f(float x);
/*@ pure @*/ float expm1f(float x);
/*@
  ensures \result == (x >= 0 ? x : -x);
  decreases;
@*/
/*@ pure @*/ float fabsf(float x);
/*@ pure @*/ float fdimf(float x, float y);
/*@ pure @*/ float fdividef(float x, float y);
/*@
  ensures \result == (float)((int)x);
  decreases;
@*/
/*@ pure @*/ float floorf(float x);
/*@ pure @*/ float fmaf(float x, float y, float z);
/*@ pure @*/ float fmaxf(float x, float y);
/*@ pure @*/ float fminf(float x, float y);
/*@ pure @*/ float fmodf(float x, float y);
/*@ pure @*/ float frexpf(float x, int *nptr);
/*@
  ensures \result == powf(x*x + y*y, 0.5);
  decreases;
@*/
/*@ pure @*/ float hypotf(float x, float y);
/*@ pure @*/ int ilogbf(float x);
/*@ pure @*/ int isfinite(float a);
/*@ pure @*/ int isinf(float a);
/*@ pure @*/ int isnan(float a);
/*@ pure @*/ float j0f(float x);
/*@ pure @*/ float j1f(float x);
/*@ pure @*/ float jnf(int n, float x);
/*@ pure @*/ float ldexpf(float x, int exp);
/*@ pure @*/ float lgammaf(float x);
/*@ pure @*/ long long int llrintf(float x);
/*@ pure @*/ long long int llroundf(float x);
/*@ pure @*/ float log10f(float x);
/*@ pure @*/ float log1pf(float x);
/*@ pure @*/ float log2f(float x);
/*@ pure @*/ float logbf(float x);
/*@
  decreases;
@*/
/*@ pure @*/ float logf(float x);
/*@ pure @*/ long int lrintf(float x);
/*@ pure @*/ long int lroundf(float x);
/*@ pure @*/ float max(const float a, const float b);
/*@ pure @*/ float min(const float a, const float b);
/*@ pure @*/ float modff(float x, float *iptr);
/*@ pure @*/ float nanf(const char *tagp);
/*@ pure @*/ float nearbyintf(float x);
/*@ pure @*/ float nextafterf(float x, float y);
/*@ pure @*/ float norm3df(float a, float b, float c);
/*@ pure @*/ float norm4df(float a, float b, float c, float d);
/*@ pure @*/ float normcdff(float x);
/*@ pure @*/ float normcdfinvf(float x);
/*@ pure @*/ float normf(int dim, float const *p);
/*@
  ensures \result == \pow(x, y);
  ensures x > 0 ==> \result > 0;
  decreases;
@*/
/*@ pure @*/ float powf(float x, float y);
/*@ pure @*/ float rcbrtf(float x);
/*@ pure @*/ float remainderf(float x, float y);
/*@ pure @*/ float remquof(float x, float y, int *quo);
/*@ pure @*/ float rhypotf(float x, float y);
/*@ pure @*/ float rintf(float x);
/*@ pure @*/ float rnorm3df(float a, float b, float c);
/*@ pure @*/ float rnorm4df(float a, float b, float c, float d);
/*@ pure @*/ float rnormf(int dim, float const *p);
/*@
  ensures !(x < 0 && \is_int(x-0.5)) ==> \result == (float)(int)(x + 0.5);
  ensures (x < 0 && \is_int(x-0.5)) ==> \result == x-0.5;
  decreases;
@*/
/*@ pure @*/ float roundf(float x);
/*@ pure @*/ float rsqrtf(float x);
/*@ pure @*/ float scalblnf(float x, long int n);
/*@ pure @*/ float scalbnf(float x, int n);
/*@ pure @*/ int signbit(float a);
/*@ pure @*/ void sincosf(float x, float *sptr, float *cptr);
/*@ pure @*/ void sincospif(float x, float *sptr, float *cptr);
/*@ ensures \result >= -1 && \result <= 1;
    decreases;
@*/
/*@ pure @*/ float sinf(float x);
/*@
  ensures \result == (expf(x) - expf(-x)) \ 2;
  decreases;
@*/
/*@ pure @*/ float sinhf(float x);
/*@ pure @*/ float sinpif(float x);
/*@
  requires x>= 0;
  ensures \result == \pow(x, 0.5);
  decreases;
@*/
/*@ pure @*/ float sqrtf(float x);
/*@
  ensures x == 0 ==> \result == 0;
  decreases;
@*/
/*@ pure @*/ float tanf(float x);
/*@
  ensures \result == (expf(x) - expf(-x)) \ (expf(x) + expf(-x));
  decreases;
@*/
/*@ pure @*/ float tanhf(float x);
/*@ pure @*/ float tgammaf(float x);
/*@ pure @*/ float truncf(float x);
/*@ pure @*/ float y0f(float x);
/*@ pure @*/ float y1f(float x);
/*@ pure @*/ float ynf(int n, float x);

/*@ pure @*/ float __cosf(float x);
/*@ pure @*/ float __exp10f(float x);
/*@ pure @*/ float __expf(float x);
/*@ pure @*/ float __fadd_rd(float x, float y);
/*@ pure @*/ float __fadd_rn(float x, float y);
/*@ pure @*/ float __fadd_ru(float x, float y);
/*@ pure @*/ float __fadd_rz(float x, float y);
/*@ pure @*/ float __fdiv_rd(float x, float y);
/*@ pure @*/ float __fdiv_rn(float x, float y);
/*@ pure @*/ float __fdiv_ru(float x, float y);
/*@ pure @*/ float __fdiv_rz(float x, float y);
/*@ pure @*/ float __fdividef(float x, float y);
/*@ pure @*/ float __fmaf_ieee_rd(float x, float y, float z);
/*@ pure @*/ float __fmaf_ieee_rn(float x, float y, float z);
/*@ pure @*/ float __fmaf_ieee_ru(float x, float y, float z);
/*@ pure @*/ float __fmaf_ieee_rz(float x, float y, float z);
/*@ pure @*/ float __fmaf_rd(float x, float y, float z);
/*@ pure @*/ float __fmaf_rn(float x, float y, float z);
/*@ pure @*/ float __fmaf_ru(float x, float y, float z);
/*@ pure @*/ float __fmaf_rz(float x, float y, float z);
/*@ pure @*/ float __fmul_rd(float x, float y);
/*@ pure @*/ float __fmul_rn(float x, float y);
/*@ pure @*/ float __fmul_ru(float x, float y);
/*@ pure @*/ float __fmul_rz(float x, float y);
/*@ pure @*/ float __frcp_rd(float x);
/*@ pure @*/ float __frcp_rn(float x);
/*@ pure @*/ float __frcp_ru(float x);
/*@ pure @*/ float __frcp_rz(float x);
/*@ pure @*/ float __frsqrt_rn(float x);
/*@ pure @*/ float __fsqrt_rd(float x);
/*@ pure @*/ float __fsqrt_rn(float x);
/*@ pure @*/ float __fsqrt_ru(float x);
/*@ pure @*/ float __fsqrt_rz(float x);
/*@ pure @*/ float __fsub_rd(float x, float y);
/*@ pure @*/ float __fsub_rn(float x, float y);
/*@ pure @*/ float __fsub_ru(float x, float y);
/*@ pure @*/ float __fsub_rz(float x, float y);
/*@ pure @*/ float __log10f(float x);
/*@ pure @*/ float __log2f(float x);
/*@ pure @*/ float __logf(float x);
/*@ pure @*/ float __powf(float x, float y);
/*@ pure @*/ float __saturatef(float x);
/*@ pure @*/ void __sincosf(float x, float *sptr, float *cptr);
/*@ pure @*/ float __sinf(float x);
/*@ pure @*/ float __tanf(float x);
/*@ pure @*/ float __tanhf(float x);
#endif
