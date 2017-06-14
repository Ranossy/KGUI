------------------------------------------------
-- 创建人   :  刘欣	
-- 创建时间	:  2007-04-18
-- 效果备注	:  万花场景用道具技能，造成伤害
------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Include/Math.lh")
Include("scripts/Include/Npc.lh")

--------------厚道的分割线-----------------------------------------------------
tSkillData =
{
     {nCostMana = 0, nAPAdd = 110, nMaxRadius = 10, nAngleRange = 128, nPrepareFrames = 48, nBulletVelocity = 0, nBreakRate = 1024},--工圣机关
	 {nCostMana = 0, nAPAdd = 50, nMaxRadius = 10, nAngleRange = 128, nPrepareFrames = 80, nBulletVelocity = 0, nBreakRate = 1024},--司徒机关
	 {nCostMana = 0, nAPAdd = 50, nMaxRadius = 5, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--万花NPC  蓬莱青女、蓬莱紫女                        飞刀
	 
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
	if skill.dwLevel == 1 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
			ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE, 
			tSkillData[dwSkillLevel].nAPAdd,
			0
		);
		
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
			ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE, 
			0,
			0
		);
		
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- 属性作用模式
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
			"skill/Quest/万花_工圣的锐雷猎鳄.lua",						-- 属性值1
			0															-- 属性值2
		);
    end
	
	if skill.dwLevel == 2 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
			ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE, 
			1,
			0
		);
	          
	    skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
			ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND, 
			79,
			0
		);
		
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
			ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE, 
			0,
			0
		);
		
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- 属性作用模式
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
			"skill/Quest/万花_司徒的锐雷猎鳄.lua",						-- 属性值1
			0															-- 属性值2
		);
	end
	

	
	----------------- 设置Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    
    --skill.SetNormalCoolDown(1, 11);
	
    --设置其他参数-------
  
    --内力消耗
    skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --攻击半径，也就是攻击的有效距离
    skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
    skill.nAngleRange       = tSkillData[dwSkillLevel].nAngleRange; 
    --吟唱帧数
    skill.nPrepareFrames    = tSkillData[dwSkillLevel].nPrepareFrames;
    --子弹速度
    skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
    --被打断的概率
    skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
    return true;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end




--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    local nTargetType, nTargetID = player.GetTarget();
    if nTargetType == TARGET.NPC then
	    local targetNpc = GetNpc(nTargetID)
	    if targetNpc.dwTemplateID == 133 then
           return SKILL_RESULT_CODE.SUCCESS;
		end
	end
		
	return SKILL_RESULT_CODE.FAILED;
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local nQuestID = 176
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	local nQuestID1 = 8249
	local nQuestIndex1 = player.GetQuestIndex(nQuestID1)
	local nQuestPhase1 = player.GetQuestPhase(nQuestID1)
	if nQuestIndex then 	
		if player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 529) <= 1 and player.GetQuestValue(nQuestIndex, 0) < 1 then
			player.SetQuestValue(nQuestIndex, 0, 1)
		elseif player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 529) <= 4 and Random(10) <= 6 and player.GetQuestValue(nQuestIndex, 0) < 1 then
			player.SetQuestValue(nQuestIndex, 0, 1)	
		end
	end 
	if nQuestIndex1 then 
		if player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 529) <= 1 and player.GetQuestValue(nQuestIndex1, 0) < 1 then
			player.SetQuestValue(nQuestIndex1, 0, 1)
		elseif player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 529) <= 4 and Random(10) <= 6 and player.GetQuestValue(nQuestIndex1, 0) < 1 then
			player.SetQuestValue(nQuestIndex1, 0, 1)	
		end
	end 
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com