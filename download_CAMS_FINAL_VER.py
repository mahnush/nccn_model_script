#this script downloads the CAMS reanalyses in model levels and surfaca in grib format for a given time peride--- to download the data for whole year must give the date for example as
#01/01/2006 - 01/01/2007
import numpy as np
start_year = '2019'
end_year = '2021'
s_month = '01'
s_day = '01'
e_month = '01'
e_day = '01'
start_date = start_year+'-'+s_month+'-'+s_day
end_date = end_year+'-'+e_month+'-'+e_day

path_model_levels = '/poorgafile1/climate/mhaghigh/input_NCCN_CALIPSO/model_levels/'
path_surface =  '/poorgafile1/climate/mhaghigh/input_NCCN_CALIPSO/surface/'
def get_model_level_data_GRIB (date):

    import cdsapi

    c = cdsapi.Client()

    c.retrieve(
        'cams-global-reanalysis-eac4',
        {
            'variable': [
                'dust_aerosol_0.03-0.55um_mixing_ratio', 'dust_aerosol_0.55-0.9um_mixing_ratio', 'dust_aerosol_0.9-20um_mixing_ratio',
                'hydrophilic_black_carbon_aerosol_mixing_ratio', 'hydrophilic_organic_matter_aerosol_mixing_ratio', 'hydrophobic_black_carbon_aerosol_mixing_ratio',
                'hydrophobic_organic_matter_aerosol_mixing_ratio', 'sea_salt_aerosol_0.03-0.5um_mixing_ratio', 'sea_salt_aerosol_0.5-5um_mixing_ratio',
                'sea_salt_aerosol_5-20um_mixing_ratio', 'specific_humidity', 'sulphate_aerosol_mixing_ratio',
                'temperature',
            ],
            'model_level': [
               '1', '2', '3',
                '4', '5', '6',
                '7', '8', '9',
                '10', '11', '12',
                '13', '14', '15',
                '16', '17', '18',
                '19', '20', '21',
                '22', '23', '24',
                '25', '26', '27',
                '28', '29', '30',
                '31', '32', '33',
                '34', '35', '36',
                '37', '38', '39',
                '40', '41', '42',
                '43', '44', '45',
                '46', '47', '48',
                '49', '50', '51',
                '52', '53', '54',
                '55', '56', '57',
                '58', '59', '60',
            ],
            'date': date,
            'time': '00:00',
            'format': 'grib',
        },
        path_model_levels + date + '.grib')
    return

def get_surface_data_NETCDF(date):
    import cdsapi

    c = cdsapi.Client()

    c.retrieve(
        'cams-global-reanalysis-eac4',
        {
            'variable': [
                'surface_geopotential', 'surface_pressure',
            ],
            'date': date,
            'time': [
                '00:00',
            ],
            'format': 'netcdf',
        },
        path_surface + date +'.nc')
    return


def get_surface_data_GRIB(date):
    import cdsapi

    c = cdsapi.Client()

    c.retrieve(
        'cams-global-reanalysis-eac4',
        {
            'variable': [
                'surface_geopotential', 'surface_pressure',
            ],
            'date': date,
            'time': [
                '00:00',
            ],
            'format': 'grib',
        },
        path_surface + date +'.grib')
    return
start = np.datetime64(start_date)
stop = np.datetime64(end_date)
date = np.arange(start, stop, dtype='datetime64[D]')

for n,date in enumerate(date):
    date = str(date)
    print(date)
    get_model_level_data_GRIB(date)
    get_surface_data_GRIB(date)
