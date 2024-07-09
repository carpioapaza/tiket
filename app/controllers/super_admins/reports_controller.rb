class SuperAdmins::ReportsController < SuperAdminController
  def index
  end

  def generate_and_download_report
    GenerateReportJob.perform_later

    respond_to do |format|
      format.js { render inline: "window.location.reload();" } # Recarga la página para permitir la descarga
      format.html { redirect_to super_admins_reports_path, notice: "El informe se está generando y estará disponible pronto." }
    end
  end
end
