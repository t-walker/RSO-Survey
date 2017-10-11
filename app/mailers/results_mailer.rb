class ResultsMailer < ApplicationMailer
  default from: 'charlie@czhanacek.com'


  def results_email(results)
    @results = results

end
