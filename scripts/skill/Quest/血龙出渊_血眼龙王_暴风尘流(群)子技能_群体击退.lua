------------------------------------------------
-- 文件名    :  群抓子技能_群体击退.lua
-- 创建人    :  zhx	
-- 创建时间  :  20110412	
-- 用途(模块):  血眼龙王
-- 武功门派  :  
-- 武功类型  :  
-- 武功套路  :  
-- 技能名称  :  沧月
-- 技能效果  :  群体伤害+击退+DEBUFF
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--附加仇恨暂定和技能伤害相等
tSkillData =
{
	{nDamageBase = 11800*0.8, nDamageRand = 11800*0.4, nCostMana = 0},		--level 1
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 2
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 3
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 4
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 5
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 6
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 7
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 8
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 9
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 10
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 11
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 12
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 13
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 14
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 15
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 16
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 17
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 18
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 19
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 20
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 21
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 22
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 23
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 24
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 25
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 26
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 27
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 28
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 29
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 30
	
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;

 skill.AddAttribute( 
   ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,                        
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,                                      
		tSkillData[dwSkillLevel].nDamageBase * 0.14,                                     
		0                                                                         
	);                                                                            
                                                                                  
	skill.AddAttribute(                                                           
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,                        
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,                                 
		tSkillData[dwSkillLevel].nDamageRand * 0.14,                                     
		0                                                                         
	);                                                                            
                                                                                  
	skill.AddAttribute(                                                           
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,                        
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,                                       
		0,                                                                        
		0                                                                         
	);
		
	skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
	ATTRIBUTE_TYPE.CALL_REPULSED,
	22,  --速度
        0
    );   
        					   
    skill.BindBuff(1, 2748, 1);
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
--	skill.SetPublicCoolDown(16);		--公共CD1秒
--	skill.SetNormalCoolDown(2, 93);
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana	= 0;
	
	 ----------------- 时间相关 -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- 吟唱帧数
    --skill.nChannelInterval	= 15; 				-- 通道技间隔时间 
    --skill.nChannelFrame		= 48;	 			-- 通道技持续时间，单位帧数 
    --skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
        ----------------- 打断相关 -------------------------------------------------
    --skill.nBrokenRate      = 0 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
    --skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024
    
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent	= 0;
	
	skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius        = 8 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 256; 										--施放角度,全角256
	skill.nAreaRadius		= 8 * LENGTH_BASE;
	skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	skill.nBulletVelocity   = 30;										--子弹速度,点/帧
 	skill.nDismountingRate  = 1024;									--落马率为100% 
	skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
	skill.nTargetCountLimit	= 30;
    return true;
end


--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npc = GetNpc(nCharacterID)
	if not npc then 
		return
	end
	npc.CastSkill(7414,1)   
end
function Apply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com