module Timer = {
	@react.component
	let make = (~isActive) => {

		let (seconds, setSeconds) = React.useState(_ => 0)

		let updateTime = () => setSeconds(_ => seconds + 1000)

		React.useEffect(() => {
			if isActive {
				let interval = Js.Global.setInterval(updateTime, 1000)
				Some(() => Js.Global.clearInterval(interval))
			} else {
				None
			}
		})

		let time = React.int(seconds/1000) //React.string(minutes->Belt.Int.toString ++  "." ++ seconds->Belt.Int.toString)

		<div className="text-center">
			time
		</div>
	}
}