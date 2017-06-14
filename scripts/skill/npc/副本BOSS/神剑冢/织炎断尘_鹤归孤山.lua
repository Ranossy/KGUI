------------------------------------------------
-- 创建人   :  郑海星	
-- 创建时间	:  20110825
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 20 ,nDamage = 141*0.95, nDamageRand = 141*0.1, nDashSpeed = 27},   	-- Level 1 
	{nAddRage = 0, nCostRage = 20 ,nDamage = 164*0.95, nDamageRand = 164*0.1, nDashSpeed = 80},   	-- Level 2
	{nAddRage = 0, nCostRage = 20 ,nDamage = 188*0.95, nDamageRand = 188*0.1, nDashSpeed = 80},   	-- Level 3
	{nAddRage = 0, nCostRage = 20 ,nDamage = 212*0.95, nDamageRand = 212*0.1, nDashSpeed = 80},   	-- Level 4
	{nAddRage = 0, nCostRage = 20 ,nDamage = 235*0.95, nDamageRand = 235*0.1, nDashSpeed = 80},   	-- Level 5
	{nAddRage = 0, nCostRage = 20 ,nDamage = 259*0.95, nDamageRand = 259*0.1, nDashSpeed = 80}   	-- Level 6

};           
             

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_FORWARD,
		12,													--12frames,速度为80，距离则为15米
		tSkillData[dwSkillLevel].nDashSpeed
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		3179,
		1
	);
	
	skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	ATTRIBUTE_TYPE.CALL_BUFF,
	1695,
	1
	);--添加换动作用隐藏Buff
	

    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);	
	--skill.SetNormalCoolDown(1, 337);
	--skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
   	--skill.nChannelInterval	= 80;
	skill.nMinRadius	= 0* LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius        = 8 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 128; 										--施放角度,全角256
    skill.nWeaponDamagePercent	= 0;
	--skill.nPrepareFrames    = 32;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
    ----------------- 打退打断落马相关 -------------------------------------------------
    skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
    --skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
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

function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then 
		return
	end
	npc.CastSkill(3158,1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com