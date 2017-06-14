---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_轻功_震地拔冲.lua
-- 更新时间:	2013/6/3 0:02:08
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  万花_轻功_震地拔冲.lua
-- 创建人    :  刘欣
-- 创建时间  :  2008-3-7
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  外功
-- 武功套路  :  万花轻功
-- 技能名称  :  震地拔冲
-- 技能效果  :  向自己的后方快速移动，起跳时会造成范围伤害,不能命中跳跃中的目标
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nSpeed = 60, nCostMana = 125},
	{nSpeed = 60, nCostMana = 226},
	{nSpeed = 60, nCostMana = 314},
	{nSpeed = 60, nCostMana = 401},
	{nSpeed = 60, nCostMana = 488},
	{nSpeed = 60, nCostMana = 576}
};
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14642,
		1
		);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_BACKWARD,
		16,
		tSkillData[dwSkillLevel].nSpeed
		);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/万花_轻功_震地拔冲.lua", -- 连协技
		0
	);		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		497, --AOE伤害技能
		dwSkillLevel
	);
    	
	skill.BindBuff(1, 1104, 1)--换动作隐藏BUFF

	skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff--吞日月，禁轻功
	----------------- 设置Cool down ---------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 193);
	skill.SetCheckCoolDown(1, 444)
	
	----------------- 设置杂项参数 ----------------------------------------  
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	skill.nCostManaBasePercent = 102;	-- 技能消耗的内力
	--攻击半径，也就是攻击的有效距离
	skill.nMaxRadius = 4 * LENGTH_BASE;
	--skill.nAngleRange       = 256; 
	--skill.nAreaRadius	=	8 * LENGTH_BASE;
	--吟唱帧数
	skill.nPrepareFrames = 0;
	--子弹速度
	skill.nBulletVelocity = 0;
	--被打断的概率
	--skill.nDismountingRate  = 1024;									
	skill.nBreakRate = 1000;
	--硬直
	--skill.nStiffFrames		= 16
   
	return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	if player.GetSkillLevel(14641) ~= 1 and player.nMoveState == 14 then
		return false
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
	--[[
	--解除自身减速锁足效果
	if player.GetSkillLevel(14641) == 1 then
		player.CastSkill(14642, 1)
	end
	--]]
	--太阴降低调息解除锁足
	if player.GetSkillLevel(6684) == 1 then
		--player.AddBuff(dwCharacterID, player.nLevel, 6261, 1, 1)
	end

	--合并后太阴减伤加速
	if player.GetSkillLevel(6685) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6262, 1, 1)
		player.AddBuff(dwCharacterID, player.nLevel, 6261, 1, 1)
	end

	--花间心法4秒免控
	if player.GetSkillLevel(13982) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 9107, 1)
		--player.AddBuff(dwCharacterID, player.nLevel, 9059, 1)
	end

	--太阴指后退技能
	--player.CastSkill(14668, 1)
	ModityCDToUI(player, 228, 0, 0)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com