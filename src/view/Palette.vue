<template>
    <div class="platte">
        <nav-header />
        <div class="container">
            <palette-box />
        </div>
        <nav-bottom />
    </div>
</template>
<script>
import NavHeader from '@/components/NavHeader'
import NavBottom from '@/components/NavBottom'
import PaletteBox from '@/components/PaletteBox'

export default {
    components: {
        NavHeader,
        NavBottom,
        PaletteBox
    },
    data() {
        return {

        }
    }
}
</script>
<style lang="scss" scoped>

</style>
