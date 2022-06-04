<script lang="ts">
	let number: string | null = null

	$: ok = number !== null && isValid(number)
	$: message = read(number)

	function isValid(number: string): boolean {
		return !Number.isNaN(parseFloat(number))
	}

	function read(number: string | null): string {
		if (number === null || !isValid(number)) {
			return 'Enter a valid number'
		}
		return number
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
