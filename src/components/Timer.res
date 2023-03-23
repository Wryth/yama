%%raw(`
import { UseBell } from "./UseBell.ts";
`)

module Timer = {

	@react.component
	let make = (~isActive) => {
		let soundInterval = 300_000
		let minuteDenominator = 60_000
		let tick = 1000

		let (milliseconds, setMilliseconds) = React.useState(_ => 0)

		React.useEffect(() => {
			let updateTime = () => setMilliseconds(_ => milliseconds + tick)
			if isActive {
				let interval = Js.Global.setInterval(updateTime, tick)
				Some(() => Js.Global.clearInterval(interval))
			} else {
				None
			}
		})

		// Play sound each 5th minute if active
		let play = 
			switch mod(milliseconds, soundInterval) == 0 && isActive {
			| true => %raw(`<UseBell />`)
			| false => <></>
			}

		let minutes = (milliseconds/minuteDenominator)->Belt_Int.toString
		let seconds = (mod(milliseconds, minuteDenominator)/tick)->Belt_Int.toString
		let time = 
			React.string(minutes ++ ":" ++ seconds)

		<>
			<div className="text-center">
				time
			</div>
			play
		</>
	}
}