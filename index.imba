tag simple-gallery-view

	prop images
	prop index default: 0
	prop height default: "1024px"
	prop width default: "768px"

	### css scoped
	p {
		color: red;
	}
	simple-gallery-view {
		border: 3px solid green;
	}

	.current-image {
	}

	main {
		display: grid;
		grid-template: repeat(4,1fr) / repeat(3, 1fr);
	}

	button {
		font-size: 2rem;
		height: 3.0rem;
		width: 3.0rem;
		border-radius: 0.7rem;
		color: white;
		background: black;
		border: none;
		justify-self: center;
		align-self: center;
		opacity: 0.6;
	}

	.previous-image {
		grid-column: 1 / 2;
		grid-row: 2;
	}

	.next-image {
		grid-column: 3 / 4;
		grid-row: 2;
	}

	.current-image {
		grid-column: 1 / span 3;
		grid-row: 1 / span 3;
		z-index: -1;
		justify-self: center;
	}

	.caption {
		grid-column: 1 / 4;
		grid-row: 4;
		justify-self: center;
		padding: 1rem;
		color: black;
	}
	.index {
		grid-column: -3 / -2;
		grid-row: 4;
		justify-self: center;
	}
	header {
		text-align: center;
	}

	.title {
		color: tomato;
	}
	###

	def currentImage 
		return self.images[self.index].url

	def caption
		return self.images[self.index].caption

	def increment
		return unless self.index < self.images.length
		self.index = self.index + 1

	def decrement
		return unless self.index > 0
		self.index = self.index - 1

	def render
		<self>
			<main>
				<button.previous-image :click.decrement> "<"
				<figure.current-image>
					<img src=self.currentImage()> "Current Image goes here"
					<figcaption> self.caption()
				<button.next-image :click.increment> ">"
				<div.index> "{self.index + 1} / {self.images.length}"
