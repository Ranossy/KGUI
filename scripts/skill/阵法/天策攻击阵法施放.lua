---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/阵法/天策攻击阵法施放.lua
-- 更新时间:	2013/5/7 21:48:12
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策防御阵法施放.lua
-- 创建人    :  吴娟	
-- 创建时间  :  2009-02-23
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  天策防御阵法施放.lua
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	--	开启阵法时清除阵法BUFF
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DETACH_MULTI_GROUP_BUFF,
		23,
		100
	);
    
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		929, --施放的hot
		1			--Level
	);

    
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- skill.SetPublicCoolDown(16);
	--skill.SetPublicCoolDown(592);
	skill.SetNormalCoolDown(1, 592);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

	----------------- 设置杂项参数 ----------------------------------------
	skill.bIgnorePrepareState = true	--技能是否可在吟唱中施放，吟唱、通道、蓄力技不能填true
	
	--攻击半径，也就是攻击的有效距离
	skill.nMaxRadius = 30 * LENGTH_BASE;
	skill.nAngleRange = 256; 	--全方位
	--吟唱帧数
	skill.nPrepareFrames = 0;	--瞬发
	--子弹速度
	skill.nBulletVelocity = 0;
	--被打断的概率
	skill.nBreakRate = 1000;
	--阵眼
	skill.bIsFormationSkill = true
	--框选范围 框选范围用于下面的人数判断--
	skill.nFormationRange = 20 * LENGTH_BASE	
	--范围队员人数
	skill.nLeastFormationPopulation = 1	
	
	return true;
end



-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	local dwSkillLevel = skill.dwLevel;
	
	player.LearnSkill(860);--阵法第1重
	player.LearnSkill(772);--阵法第2重
	player.LearnSkill(773);--阵法第3重
	player.LearnSkill(861);--阵法第4重
	player.LearnSkill(862);--阵法第5重
	player.LearnSkill(863);--阵法第6重
	player.LearnSkill(800);--关闭阵法
	
	
end
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com