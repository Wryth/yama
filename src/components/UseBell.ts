import useSound from 'use-sound';

export const UseBell = () => {
	const [play] = useSound("/singing-bowl.mp3")
	play()

	return null
}

