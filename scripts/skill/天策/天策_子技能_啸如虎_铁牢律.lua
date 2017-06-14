------------------------------------------------
-- 文件名    :  天策_子技能_啸如虎_铁牢律.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-03-5
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  啸如虎
-- 技能名称  :  背水一战
-- 技能效果  :  少于30%生命使用,大幅提高外功攻击力,外功会心值,外功防御力,同时短时间不会死亡
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostMana = 0, nBuffID = 10225, nBuffLevel = 1},		-- Level 1
	{nCostMana = 0, nBuffID = 10225, nBuffLevel = 2},		-- Level 2
	{nCostMana = 0, nBuffID = 10225, nBuffLevel = 3},		-- Level 3
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;
	

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_BUFF,
		tSkillData[dwSkillLevel].nBuffID,
		tSkillData[dwSkillLevel].nBuffLevel
	);
   --08年8月29日 该技能不再回复生命. 注释以下代码.
--    skill.AddAttribute(
--    	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.SKILL_THERAPY,
--		tSkillData[dwSkillLevel].nTherapy,
--		0
--    )
--    
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
--		ATTRIBUTE_TYPE.CALL_THERAPY,
--		0,
--		0
--	);
		

    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--公共CD1秒
	--skill.SetNormalCoolDown(2, 100);
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 4 * LENGTH_BASE;							--技能施放最大半径
    skill.nAngleRange       = 256; 										--施放角度,全角256
    
    
    skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
	skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
   
    return true;
end


--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	local dwPlayerLife = player.nCurrentLife;
	local dwPlayerMaxLife = player.nMaxLife;
    
	if dwPlayerLife  <  dwPlayerMaxLife*0.3 then
	else
		return false;
	end
    
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--以下是魔法属性应用时的执行脚本,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
 
end

--以下是魔法属性反应用时的执行脚本,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)

end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com