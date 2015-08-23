
var
  React $ require :react
  Immutable $ require :immutable

var
  actions $ require :../actions

var
  div $ React.createFactory :div
  input $ React.createFactory :input

= module.exports $ React.createClass $ {}
  :displayName :app-todolist

  :propTypes $ {}
    :store $ React.PropTypes.instanceOf Immutable.List

  :onAdd $ \ ()
    actions.add

  :rendeTask $ \ (task)
    var onToggle $ \\ ()
      actions.toggle $ task.get :id
    var onUpdate $ \\ (event)
      actions.update (task.get :id) event.target.value
    var onRemove $ \\ ()
      actions.remove (task.get :id)

    div ({} (:className ":todolist-task line"))
      input $ {} (:type :checkbox) (:checked $ task.get :done)
        :onClick onToggle
      input $ {} (:type :text) (:value $ task.get :text)
        :onChange onUpdate
      div
        {} (:className ":button is-danger") (:onClick onRemove)
        , :Remove

  :render $ \ ()
    div ({} (:className :app-todolist))
      div ({} (:className :todolist-header))
        div
          {} (:className ":button is-attract") (:onClick this.onAdd)
          , :Add
      div ({} (:className :todolist-table))
        this.props.store.map this.rendeTask
