class MyTable < Reins::Model::SQLite
end

class QuotesController < Reins::Controller
  def a_quote
    @noun = :winking
    # render :a_quote, noun: :winking
  end

  def show
    @obj = FileModel.find(params['id'])
    @ua = request.user_agent
    # render :quote, obj: quote, ua: ua
  end

  def sql_index
    @quotes = MyTable.all
  end

  def index
    @quotes = FileModel.all
    # render :index, quotes: quotes
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth one k pixels",
      "attribution" => "Me"
    }
    m = FileModel.create attrs
    render :quote, obj: m
  end

  def update_quote
    raise "Incorrect method" if env['REQUEST_METHOD'] != 'POST'
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth a thousand words",
      "attribution" => "Me"
    }
    m = FileModel.update attrs
    render :quote, obj: m
  end

  def by_submitter
    quotes = FileModel.find_all_by_submitter('web user')
    render :index, quotes: quotes
  end

  def exception
    raise "It's a bad one!"
  end
end