export default class Dice {
    constructor(value) {
        this.value = value
    }

    roll() {
        return (this.value = Math.floor(Math.random() * 6 + 1))
    }

    getValue() {
        return this.value
    }
}
