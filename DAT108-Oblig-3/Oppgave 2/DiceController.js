import Dice from './Dice.js'

class DiceController extends Dice {
    constructor(run) {
        super()
        this.run = this.run.bind(this)
    }

    run() {
        const btRef = document
            .getElementById('root')
            .querySelector('*[data-dicebutton]')

        btRef.addEventListener('click', () => {
            const d = new Dice()
            const spanRef = document
                .getElementById('root')
                .querySelector('*[data-diceoutput]')
            d.roll()
            spanRef.className = `dice dice-${d.value}`
            spanRef.innerHTML = ''
        })
    }
}

const controller = new DiceController('root')
document.addEventListener('DOMContentLoaded', controller.run, true)
