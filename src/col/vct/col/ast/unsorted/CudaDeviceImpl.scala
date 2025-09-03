package vct.col.ast.unsorted

import vct.col.ast.CudaDevice
import vct.col.ast.ops.CudaDeviceOps
import vct.col.print._

trait CudaDeviceImpl[G] extends CudaDeviceOps[G] { this: CudaDevice[G] =>
  override def layout(implicit ctx: Ctx): Doc = Text("__device__")
}
