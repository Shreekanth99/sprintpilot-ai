module NavigationHelper
  def sidebar_class(path)
    base =
      "flex items-center gap-3 px-4 py-3 rounded-xl transition"

    current_page?(path) ?
      "#{base} bg-blue-600 text-white" :
      "#{base} text-slate-300 hover:bg-slate-800"
  end
end
