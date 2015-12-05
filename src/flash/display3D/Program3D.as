package flash.display3D
{
   import flash.utils.ByteArray;
   
   public final class Program3D extends Object
   {
	   public var fshader:WebGLShader;
	   public var vshader:WebGLShader;
       public var program:WebGLProgram;
	   public var gl:WebGLRenderingContext;
      public function Program3D()
      {
         super();
      }
      
     public function upload(vcode:ByteArray, fcode:ByteArray) : void{
		fshader = gl.createShader(WebGLRenderingContext.FRAGMENT_SHADER);
		vshader = gl.createShader(WebGLRenderingContext.VERTEX_SHADER);
		gl.shaderSource(fshader,fcode.readUTFBytes(0));
		gl.compileShader(fshader);
		gl.shaderSource(vshader,vcode.readUTFBytes(0));
		gl.compileShader(vshader);

		gl.attachShader(program,vshader);
		gl.attachShader(program,fshader);
		gl.linkProgram(program);
	 }
      
     public function dispose() : void{
		 gl.deleteShader(fshader);
		 gl.deleteShader(vshader);
		 gl.deleteProgram(program);
	 }
   }
}
