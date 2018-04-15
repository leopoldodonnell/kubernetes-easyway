require 'json'

namespace :cluster do
    namespace :azure do
        
        desc 'Provision Azure Resources'
        task :provision do |t, args|
            [
                'Network',
                'Storage',
                'Compute',
                'ContainerService'
            ].each { |resource|
                MultiTool::Command.run("az provider register -n Microsoft.#{resource}")
            }
        end

        desc 'Wait for Provisioning Status to complete'
        task :provision_wait, [:wait_time_seconds] do |t, args|
            wait_time = if args.has_key?(:wait_time_seconds)
                args[:wait_time_seconds].to_i
            else
                60
            end
            [
                'Network',
                'Storage',
                'Compute',
                'ContainerService'
            ].each { |resource|
                if MultiTool::Command.run_until("az provider show -n Microsoft.#{resource} |jq '.registrationState'", wait_time, /Registered/)
                    LOGGER.info "Microsoft.#{resource} is registered"
                else
                    message = "Microsoft.#{resource} failed to register in #{wait_time} seconds"
                    LOGGER.warn message
                    raise message
                end
            }
        end
    end
end