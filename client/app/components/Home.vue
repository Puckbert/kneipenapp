<template>
  <Page class="page">
    <ActionBar class="action-bar">
      <Label class="action-bar-title" text="Home"></Label>
    </ActionBar>

    <ListView :for="kneipe in kneipen" class="list-group">
      <v-template>
        <GridLayout class="list-group-item" rows="auto, *" columns="80,*">
         <Label class="list-group-item-heading" :text="kneipe.name" textWrap="true" />
         <Label class="list-group-item-text" text="The rest of the content" textWrap="true" />
        </GridLayout>
      </v-template>
    </ListView>
  </Page>
</template>

<script>
export default {
  data: function(){
      return{
          kneipen: [{}]
      }
  },
  created: function() {
    
      fetch('http://192.168.0.17:8080/alleKneipen')
      .then((res) => {
          return res.json();
      })
      .then((data) => {
          this.kneipen = data;
        //    console.log(data);  
          console.log(JSON.stringify(this.kneipen));
        
      })
      
  }
};
</script>

<style scoped lang="scss">
// Start custom common variables
@import "../app-variables";
// End custom common variables

// Custom styles
.fa {
  color: $accent-dark;
}

.info {
  font-size: 20;
}
</style>
