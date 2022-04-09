<script lang="ts">
	export let id: string
	export let name: string
	export let text: string
	export let checked = false
</script>

<!-- Don't wrap these -->
<input type="radio" id="{id}" name="{name}" checked="{checked}" />
<label for="{id}">{text}</label>

<style></style>
