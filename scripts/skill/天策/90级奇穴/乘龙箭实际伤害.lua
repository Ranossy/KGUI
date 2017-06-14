---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/90级奇穴/乘龙箭实际伤害.lua
-- 更新时间:	2013/5/10 11:47:08
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_游龙骑法_骑射.lua
-- 创建人    :  张豪	
-- 创建时间  :  2011-04-11
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  游龙骑法
-- 技能名称  :  骑射
-- 技能效果  :  马上射箭，打断目标施法
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamage = 140, nDamageRand = 10, nLevel = 1, nCostMana = 57, nDebuffLevel = 1}, 
};



--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
	    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/90级奇穴/乘龙箭实际伤害.lua", -- 属性值1
		0														-- 属性值2
	);

	--skill.BindBuff(1, 3465, 1)  --减外防
	
	
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--公共CD1秒
	--skill.SetNormalCoolDown(1, 436);
	--skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 80;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nMinPrepareFrames = 1;
	skill.nWeaponDamagePercent = 0;
	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 30 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
	skill.nPrepareFrames = 8;										--吟唱帧数,16帧等于1秒
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
	skill.nChannelInterval = 160; 									-- 通道技间隔时间 
	skill.nBreakRate = 1024;									--打断施法概率
  
	return true;
end


--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	if nPreResult ~= SKILL_RESULT_CODE.SUCCESS then
		return nPreResult 
	end
	local target = player.GetSelectCharacter()
	if target == nil then
		return false
	end
	local nTargetDirection = GetLogicDirection(target.nX - player.nX, target.nY - player.nY);
	local nPlayerDirection = player.nFaceDirection
	local nDirectionA = math.mod(nTargetDirection + 64 + 256, 256)
	local nDirectionB = math.mod(nTargetDirection-64 + 256, 256)

	if nPlayerDirection > nDirectionA or nPlayerDirection < nDirectionB then
		player.TurnTo(math.mod(nTargetDirection + 128, 256))
		return nPreResult;
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
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.ResetCD(436)
	player.CastSkill(6529, 1)
	player.CastSkill(13778, 1)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com