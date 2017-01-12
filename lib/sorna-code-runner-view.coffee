module.exports =
class SornaCodeRunnerView
  constructor: (serializedState, caller) ->
    @caller = caller
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('sorna-code-runner')
    @element.style.width = '100%'

    # Create message element
    message = document.createElement('div')
    #message.textContent = "Sorna code runner ready!"
    message.classList.add('message')
    @element.appendChild(message)
    buttonArea = document.createElement('div')
    buttonArea.classList.add('sorna-code-runner-buttons')

    closeButton = document.createElement('span')
    closeButton.addEventListener('click', @closeView.bind(@))
    closeButton.classList.add('icon')
    closeButton.classList.add('icon-x')
    refreshButton = document.createElement('span')
    refreshButton.addEventListener('click', @refreshKernel.bind(@))
    refreshButton.classList.add('icon')
    refreshButton.classList.add('icon-repo-sync')

    buttonArea.appendChild(refreshButton)
    buttonArea.appendChild(closeButton)

    @element.appendChild(buttonArea)

  closeView: =>
    @caller.resultPanel.hide()

  refreshKernel: =>
    @caller.refreshKernel()

  setContent: (content) ->
     @element.children[0].innerHTML = content

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
