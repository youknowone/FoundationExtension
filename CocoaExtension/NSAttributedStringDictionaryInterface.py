from NSAttributedStringData import *

propnumber = """/*!
 *  @brief Set or get {name} attribute as NSNumber form.
 *  @details Generated by script {filename}
 */
@property(retain) NSNumber *{name}Number{available};"""

propnormal = """/*!
 *  @brief Set or get {name} attribute.
 *  @details Generated by script {filename}
 */
@property({attr}) {type}{typespace}{name}{available};"""

for prop in props:
    if prop.has_number:
        print propnumber.format(
            name=prop.name,
            available=' ' + prop.available_mac if prop.available else '',
            filename=__file__,
        )
    print propnormal.format(
        attr=prop.proptype,
        type=prop.type,
        typespace='' if prop.is_pointer else ' ',
        name=prop.name,
        available=' ' + prop.available_mac if prop.available else '',
        filename=__file__,
    )
