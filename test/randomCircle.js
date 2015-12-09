

canvas = document.querySelector("canvas")
canvas.height = 500
canvas.width = 500
canvas.style.border = "1px solid black"

context = canvas.getContext("2d")
context.beginPath()
context.arc(250, 250, 250, 0, 2*Math.PI)
context.stroke()




for(i = 0; i<5000; i++){
	p = Vector.randomCircle().mult(250).add(Vector.carthesian({x: 250, y: 250}))
	context.fillRect(p.x-1, p.y-1, 2, 2)
}
