<script lang="ts">
	const NODE_ENV: string = process.env.NODE_ENV ?? ''
	const ICON_REF_LINK = 'https://icons8.com/icon/FDoWrXB7G9Rc/99'
	const ICON_REF_TEXT = '99'
</script>

<footer>
	<p>Running in <strong>{NODE_ENV}</strong> mode</p>
	<p>
		<a target="_blank" href="{ICON_REF_LINK}">{ICON_REF_TEXT}</a>
		icon by <a target="_blank" href="https://icons8.com">Icons8</a>
	</p>
</footer>

<style>
	footer {
		text-align: center;
	}
</style>
