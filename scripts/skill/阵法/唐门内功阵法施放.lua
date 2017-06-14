---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/阵法/唐门内功阵法施放.lua
-- 更新时间:	2013/5/7 21:49:45
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  郑海星
-- 创建时间  :  20110920
-- 用途(模块):  唐门阵法

----------------------华丽的分割线--------------------------
tSkillData = 
{
        
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
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
		3303, --施放的hot
		1		--Level
	);

	
	----------------- 设置Cool down ---------------------------------------
	--skill.SetPublicCoolDown(16);
	--skill.SetPublicCoolDown(592);
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	
	skill.SetNormalCoolDown(1, 592);
	
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
	local dwSkillLevel = skill.dwLevel;
	
	player.LearnSkill(3341);--阵法第1重
	player.LearnSkill(3342);--阵法第2重
	player.LearnSkill(3343);--阵法第3重
	player.LearnSkill(3344);--阵法第4重
	player.LearnSkill(3345);--阵法第5重
	player.LearnSkill(3346);--阵法第6重
	player.LearnSkill(3324);--关闭阵法
	
	
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com