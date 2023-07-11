local rel = GuiLibrary.CreateOptionsButton({
    Name = "test",
    Tab = Combat,
    Function = function(callback)
       if callback then
        print("kys")
       else
        print("die")
       end
    end,
})
