package work.kscafe.platform_view_crash

import android.content.Context
import android.graphics.Paint
import android.graphics.PixelFormat
import android.view.SurfaceHolder
import android.view.SurfaceView
import android.graphics.Color
import android.view.View
import io.flutter.plugin.platform.PlatformView

internal class PlatformView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val surfaceView: SurfaceView
    
    override fun getView(): View {
        return surfaceView
    }

    override fun dispose() {}

    init {
        surfaceView = SurfaceView(context)
    }
}
