/* 
 * SmartSim - Digital Logic Circuit Designer and Simulator
 *   
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *   
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *   
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *   
 *   Filename: componentstate.vala
 *   
 *   Copyright Ashley Newson 2013
 */


/**
 * Errors involving any ComponentState, such as compile errors.
 */
public errordomain ComponentStateError {
	COMPILE
}

/**
 * A primitive compiled component.
 * 
 * A ComponentState is a fully compiled primitive component as part of a
 * compiled circuit.
 * They handle their own execution within the circuit after being called
 * by a CompiledCircuit.
 * They are constructed with the aid of a corrisponding ComponentDef,
 * which identifies the necessary connections and properties.
 */
public abstract class ComponentState {
	/**
	 * The CompiledCircuit which contains this component.
	 */
	public weak CompiledCircuit compiledCircuit;
	/**
	 * The location within the hierarchical design.
	 */
	public ComponentInst[] ancestry;
	/**
	 * The ComponentInst which this ComponentState was created from.
	 */
	public ComponentInst componentInst;
	
	public int renderQueueID;
	public int processQueueID;
	
	/**
	 * If true, then the component is within the currently viewed
	 * ancestry of the CompiledCircuit. It should display and possibly
	 * be interactive when true.
	 */
	public bool display;
	
	public virtual bool alwaysUpdate {
		get {return false;}
	}
	
	
	/**
	 * Called for every simulation iteration. Causes the component to
	 * update its internal state and outputs.
	 */
	public abstract void update ();
	
	/**
	 * Action to perform when a component has been clicked.
	 */
	public virtual void click () {
		//Do nothing by default
	}
	
	/**
	 * If the component has extra elements to display (such as a live
	 * number value), it must be done here. Called every visual refresh.
	 */
	public virtual void render (Cairo.Context context) {
		//componentInst.render (context);
		//Do nothing by default
		//Rendering is mostly done by custom component render_inst function.
	}
}
