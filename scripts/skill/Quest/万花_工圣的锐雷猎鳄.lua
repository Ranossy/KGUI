------------------------------------------------
-- ������   :  ����	
-- ����ʱ��	:  2007-04-18
-- Ч����ע	:  �򻨳����õ��߼��ܣ�����˺�
------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Include/Math.lh")
Include("scripts/Include/Npc.lh")

--------------����ķָ���-----------------------------------------------------
tSkillData =
{
     {nCostMana = 0, nAPAdd = 110, nMaxRadius = 10, nAngleRange = 128, nPrepareFrames = 48, nBulletVelocity = 0, nBreakRate = 1024},--��ʥ����
	 {nCostMana = 0, nAPAdd = 50, nMaxRadius = 10, nAngleRange = 128, nPrepareFrames = 80, nBulletVelocity = 0, nBreakRate = 1024},--˾ͽ����
	 {nCostMana = 0, nAPAdd = 50, nMaxRadius = 5, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC  ������Ů��������Ů                        �ɵ�
	 
};

--�����书���ܼ��������ֵ
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
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- ��������ģʽ
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
			"skill/Quest/��_��ʥ����������.lua",						-- ����ֵ1
			0															-- ����ֵ2
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
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- ��������ģʽ
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
			"skill/Quest/��_˾ͽ����������.lua",						-- ����ֵ1
			0															-- ����ֵ2
		);
	end
	

	
	----------------- ����Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    
    --skill.SetNormalCoolDown(1, 11);
	
    --������������-------
  
    --��������
    skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
    skill.nAngleRange       = tSkillData[dwSkillLevel].nAngleRange; 
    --����֡��
    skill.nPrepareFrames    = tSkillData[dwSkillLevel].nPrepareFrames;
    --�ӵ��ٶ�
    skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
    --����ϵĸ���
    skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
    return true;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end




--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    local nTargetType, nTargetID = player.GetTarget();
    if nTargetType == TARGET.NPC then
	    local targetNpc = GetNpc(nTargetID)
	    if targetNpc.dwTemplateID == 133 then
           return SKILL_RESULT_CODE.SUCCESS;
		end
	end
		
	return SKILL_RESULT_CODE.FAILED;
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
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

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com