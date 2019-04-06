<template>
    <div class="nav-header">
        <div class="container">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <router-link to="/" class="navbar-brand" style=""><span class="brand">COLOR RGBA</span></router-link>
                    </div>

                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="palette-li"><router-link to="/palette">Color Palette</router-link></li>
                            <li class="gradient-li"><router-link to="/gradient" href="#">Gradient</router-link></li>
                            <li class="color-li"><router-link to="/color" href="#">Color Card</router-link></li>
                            
                        </ul>
                        
                        <ul class="nav navbar-nav navbar-right">
                            <li><a target="_blank" style="padding-right:0" href="http://wpa.qq.com/msgrd?v=3&uin=2085203270&site=qq&menu=yes">Time Machine</a></li>
                            <!-- <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                            </li> -->
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {

        }
    },
    mounted() {
        this.highTitle()
    },
    methods: {
        highTitle() {
            if( this.$route.name == 'Gradient') {
                $('.gradient-li').addClass('active')
                $('.color-li').removeClass('active')
                $('.palette-li').removeClass('active')
            } else if ( this.$route.name == 'Color' ) {
                $('.color-li').addClass('active')
                $('.gradient-li').removeClass('active')
                $('.palette-li').removeClass('active')
            } else if ( this.$route.name == 'Palette' ) {
                $('.palette-li').addClass('active')
                $('.color-li').removeClass('active')
                $('.gradient-li').removeClass('active')
            }
        }
    }
}
</script>
<style lang="scss" scoped>
.navbar-default {
    background-color: #fff;
    border: none;
}
.navbar {
    margin-bottom: 0;
}
.nav-header {
    border-bottom: 1px solid #eee;
    box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}
.brand {
    background-image:-webkit-linear-gradient(111deg,blue,purple,red); 
    -webkit-background-clip:text; 
    -webkit-text-fill-color:transparent;
    cursor: pointer; 
}
.container-fluid {
    padding: 0;
}

.navbar-default .navbar-nav>li>a:focus, .navbar-default .navbar-nav>li>a:hover {
    background-image:-webkit-linear-gradient(111deg,blue,purple,red); 
    -webkit-background-clip:text; 
    -webkit-text-fill-color:transparent;
}
.active > a {
    background-color: #fff !important;
    background-image:-webkit-linear-gradient(111deg,blue,purple,red); 
    -webkit-background-clip:text; 
    -webkit-text-fill-color:transparent;
}
</style>
