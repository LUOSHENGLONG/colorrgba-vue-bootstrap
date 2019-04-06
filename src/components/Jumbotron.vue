<template>
    <div class="jumbotronBox">
        <div class="container">
            <div class="jumbotron">
                <h1>Welcome，COLOR RGBA</h1>
                <p>Hope this website can help you.</p>
                <p>Hope this website can create value for you.</p>
                <p>Hope you enjoy it.</p>
                <p>
                    <a class="btn btn-lg" role="button" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2085203270&site=qq&menu=yes">Contact Me</a>
                </p>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style lang='scss' scoped>
.jumbotron {
    background: linear-gradient(111deg, rgba(245,8,8,0.76) 0%,rgba(245,8,8,0.46) 50%,rgba(245, 8, 8, 0.623) 100%);
    color: #fff;
    .btn {
        background: linear-gradient(82deg, blue 0%,rgb(145, 73, 85) 0%,rgb(108, 131, 235) 100%);
        color: #fff;
        border: none;
    }
}
p {
    text-transform: Capitalize;
}
</style>
