class ComplianceCheckService

  attr_reader :referential
  
  def initialize(referential)
    @referential = referential
  end

  # Find a validation whith this id
  def find(id)
    ComplianceCheck.new(Ievkit.scheduled_job(referential.slug, id, { :action => "validator" }))
  end

  # Find all validations
  def all
    [].tap do |jobs|
      Ievkit.jobs(referential.slug, { :action => "validator" }).each do |job|
        jobs << ComplianceCheck.new(job)
      end
    end
  end
  
end
