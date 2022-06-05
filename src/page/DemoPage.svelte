<script lang="ts">
	import {
		InvalidNumberError,
		parseNumberData,
		ReadingConfig,
		readNumber,
		UnitNotEnoughError,
	} from 'read-vietnamese-number'

	import * as store from '../store/index'

	let number: string | null = null
	let readingConfig: ReadingConfig
	store.readingConfig.subscribe((value) => (readingConfig = value))

	$: ok = number !== null && isValid(number)
	$: message = read(number)

	function isValid(number: string): boolean {
		return !Number.isNaN(parseFloat(number))
	}

	function read(number: string | null): string {
		if (number === null || !isValid(number)) {
			return 'Enter a valid number'
		}
		try {
			// Number is string, but typeof number is number
			// So need to cast to string here to avoid error
			const numberData = parseNumberData(readingConfig, number.toString())
			return readNumber(readingConfig, numberData)
		} catch (ex) {
			return handleError(ex)
		}
	}

	function handleError(ex: unknown): string {
		if (ex instanceof InvalidNumberError) {
			return 'Invalid number'
		}
		if (ex instanceof UnitNotEnoughError) {
			return 'Unit not enough'
		}
		return 'Unknown error'
	}
</script>

<main>
	<div class="row flex-center">
		<div class="col">
			<label for="num">Enter a number</label>
			<input
				id="num"
				type="number"
				placeholder="How about -3.14"
				bind:value="{number}" />
			<div
				class="margin-top margin-bottom-none text-center alert"
				class:alert-success="{ok}"
				class:alert-warning="{!ok}">
				{message}
			</div>
		</div>
	</div>
	<div class="row flex-center">
		<div class="col">
			<button disabled class="btn-secondary">Add to favorite</button>
			<button disabled>Clear all</button>
		</div>
	</div>
</main>

<style>
	.row {
		margin-bottom: unset;
	}

	main input {
		display: unset;
	}

	label {
		padding-left: unset;
	}
</style>
