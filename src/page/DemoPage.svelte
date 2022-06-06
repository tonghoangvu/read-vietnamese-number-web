<script lang="ts">
	import {
		InvalidFormatError,
		InvalidNumberError,
		UnitNotEnoughError,
		ReadingConfig,
		validateNumber,
		parseNumberData,
		readNumber,
	} from 'read-vietnamese-number'

	import State from '../common/State'
	import * as store from '../store/index'

	let state = State.EMPTY
	let number = ''
	let message = ''
	let readingConfig: ReadingConfig
	store.readingConfig.subscribe((value) => (readingConfig = value))

	function startInput() {
		// Smooth scroll by CSS
		document.getElementById('num')?.scrollIntoView()
	}

	function read(): void {
		if (number === '') {
			state = State.EMPTY
			return
		}
		try {
			const validatedNumber = validateNumber(number)
			const numberData = parseNumberData(readingConfig, validatedNumber)
			state = State.OK
			message = readNumber(readingConfig, numberData)
		} catch (ex) {
			state = State.ERROR
			message = getErrorMessage(ex)
		}
	}

	function getErrorMessage(ex: unknown): string {
		if (ex instanceof InvalidFormatError) {
			return 'Invalid format'
		}
		if (ex instanceof InvalidNumberError) {
			return 'Invalid number'
		}
		if (ex instanceof UnitNotEnoughError) {
			return 'Unit not enough'
		}
		// eslint-disable-next-line no-console
		console.error(ex)
		return 'Unknown error'
	}
</script>

<main>
	<div class="row flex-center">
		<div class="col text-center">
			<div class="row flex-center flex-middle input-space">
				<label for="num">Enter a number</label>
				<!-- Don't use numberic input -->
				<input
					id="num"
					placeholder="How about -3.14"
					bind:value="{number}"
					on:focus="{startInput}"
					on:input="{read}" />
			</div>
			<div
				class="margin-top margin-bottom-none alert"
				hidden="{state === State.EMPTY}"
				class:alert-success="{state === State.OK}"
				class:alert-warning="{state === State.ERROR}">
				{message}
			</div>
		</div>
	</div>
	<div class="row flex-center">
		<div class="col row flex-center">
			<button disabled class="btn-secondary">Add to favorite</button>
			<button disabled>Clear all</button>
		</div>
	</div>
</main>

<style>
	.row {
		margin-bottom: unset;
	}

	.input-space {
		gap: 0.75rem;
	}

	label {
		/* Don't use padding-none class, it will be overrided */
		padding: 0;
	}

	main input {
		display: unset;
	}
</style>
