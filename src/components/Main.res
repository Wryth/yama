module Main = {
  open Timer

  @react.component
  let make = () => {
    let buttonText = React.string("Start session")

    let (isActive, setIsActive) = React.useState(_ => false)
    let startClock = event => setIsActive(_ => !isActive)

    <div className="flex h-screen justify-center px-4 py-16 bg-base-200">
      <div className="m-auto">
        <Timer isActive />
        <button className="btn btn-primary" onClick=startClock> buttonText </button>
      </div>
    </div>
  }
}
