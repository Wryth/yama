%%raw(`
import { UseBell } from "./UseBell.ts";
`)

module Timer = {
	@react.component
	let make = (~isActive) => {

		let (seconds, setSeconds) = React.useState(_ => 0)

		React.useEffect(() => {
			let updateTime = () => setSeconds(_ => seconds + 1000)
			if isActive {
				let interval = Js.Global.setInterval(updateTime, 1000)
				Some(() => Js.Global.clearInterval(interval))
			} else {
				None
			}
		})

		let play = 
			switch seconds == 300_000 {
				| true => %raw(`<UseBell />`)
				| false => <></>
				}

		let time = React.int(seconds/1000) //React.string(minutes->Belt.Int.toString ++  "." ++ seconds->Belt.Int.toString)

		<>
			<div className="text-center">
				time
			</div>
			play
		</>
	}
}