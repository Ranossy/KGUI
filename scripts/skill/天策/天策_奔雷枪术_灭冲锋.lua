---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_奔雷枪术_灭冲锋.lua
-- 更新时间:	2013/5/29 1:22:07
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_奔雷枪术_灭.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-03-05 
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  奔雷枪术
-- 技能名称  :  灭
-- 技能效果  :  损耗自身生命,对目标造成伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 0, nDamage = 324 * 0.95, nDamageRand = 324 * 0.1, nCostLife = 149}, -- Level 1	42
	{nCostMana = 0, nDamage = 172 * 0.95, nDamageRand = 172 * 0.1, nCostLife = 172}, -- Level 2  48
	{nCostMana = 0, nDamage = 196 * 0.95, nDamageRand = 196 * 0.1, nCostLife = 196}, -- Level 3  54
	{nCostMana = 0, nDamage = 219 * 0.95, nDamageRand = 219 * 0.1, nCostLife = 219}, -- Level 4  60
	{nCostMana = 0, nDamage = 243 * 0.95, nDamageRand = 243 * 0.1, nCostLife = 243}, -- Level 5  66
	{nCostMana = 0, nDamage = 324 * 0.8, nDamageRand = 324 * 0.4, nCostLife = 324}, -- Level 6  
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
--	skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
--        tSkillData[dwSkillLevel].nDamage, 
--        0
--    );
--
--	skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
--        tSkillData[dwSkillLevel].nDamageRand, 
--        0
--    );
--    
--    skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
--        ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
--        0, 
--        0
--    	);
	--施放灭_傲血战意			--使用脚本来判断施放伤害自身的技能与否
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		592,
--		dwSkillLevel
--	);
	--施放灭_傲血战意			--使用脚本来判断施放伤害自身的技能与否
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
--		"skill/天策/天策_奔雷枪术_灭.lua",
--		0
--	);
	--施放灭_低生命_对目标伤害
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		701,
		6
	);
	--施放灭_高生命_对目标伤害
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		702,
		6
	);
	--80橙武因为蛋疼问题触发不了技能事件就单独放个技能吧
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1861,
		2
	);
	--施放灭_低生命_对自身伤害				--这里使用脚本判断来施放
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL,
	--716,
	--6
	--);
	--施放灭_高生命_对自身伤害
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL,
	--717,
	--6
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/天策_奔雷枪术_灭.lua", -- 属性值1
		0														-- 属性值2
	);

        
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 101);
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= 0;	--tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostLife	=	tSkillData[dwSkillLevel].nCostLife;
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent = 1024;
	skill.nTargetLifePercentMin = 10;	
	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 10* LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	skill.nChannelInterval = 64; 
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
   
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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(38)
	end
	-- if player.IsAchievementAcquired(36) and player.IsAchievementAcquired(37) and player.IsAchievementAcquired(38) and player.IsAchievementAcquired(39) and player.IsAchievementAcquired(40) and player.IsAchievementAcquired(41) then
		-- player.AcquireAchievement(68)
	-- end
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetKungfuMount().dwSkillID == 10062 then
		player.nCurrentLife = player.nMaxLife * 0.05 + player.nCurrentLife
	end
	local target = player.GetSelectCharacter()
	if player.GetSkillLevel(6524) == 1 and target.nCurrentLife <= target.nMaxLife * 0.3 then
		player.CastSkill(6525, 6)
		player.CastSkill(6526, 6)
	else
		player.CastSkill(716, 6)
		player.CastSkill(717, 6)
	end
end

function UnApply(dwCharacterID)
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com