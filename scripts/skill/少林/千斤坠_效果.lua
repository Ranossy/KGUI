---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/千斤坠_效果.lua
-- 更新时间:	2013/9/11 9:50:56
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  千斤坠_释放.lua
-- 创建人    :  刘欣
-- 创建时间  :  2008-1-29
-- 用途(模块):  武功技能
-- 武功门派  :  江湖
-- 武功类型  :  外功
-- 武功套路  :  防身武艺
-- 技能名称  :  千斤缀_释放
-- 技能效果  :  释放千斤缀BUFF
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nSolarDamage = 16, nSolarDamageRand = 3},
	{nSolarDamage = 17, nSolarDamageRand = 3},
	{nSolarDamage = 21, nSolarDamageRand = 3},
	{nSolarDamage = 23, nSolarDamageRand = 3},
	{nSolarDamage = 26, nSolarDamageRand = 3},
	{nSolarDamage = 28, nSolarDamageRand = 3}
};
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;
	if dwSkillLevel >= 5 then
		skill.BindBuff(1, 464, 1)--眩晕效果
	end
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nSolarDamage,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nSolarDamageRand,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/少林/千斤坠_效果.lua", -- 属性值1
		0														-- 属性值2
	);

	--skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
    
	----------------- 设置Cool down ---------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetNormalCoolDown(1, 193);
	
	----------------- 设置杂项参数 ----------------------------------------  
    
	--攻击半径，也就是攻击的有效距离		
	skill.nAreaRadius = 8 * LENGTH_BASE;
	skill.nAngleRange = 256; 
	skill.nTargetCountLimit = 10;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
	--吟唱帧数
	skill.nPrepareFrames = 0;
	--子弹速度
	skill.nBulletVelocity = 0;
	--被打断的概率
	skill.nDismountingRate = 1024;									--落马率为100%
	skill.nBreakRate = 1000;
   
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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local nSkill = player.GetKungfuMount()
	if not player then
		return
	end
	if player.GetSkillLevel(5895) == 1 then
		player.CastSkill(1018, 1)
	end

	--易经心法下千斤坠给回豆
	if nSkill ~= nil and nSkill.dwSkillID == 10003 then
		player.CastSkill(1018, 1)
	end
	
	if player.GetSkillLevel(5935) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6210, 1, 1)
	end
	if player.GetSkillLevel(5936) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6211, 1, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com