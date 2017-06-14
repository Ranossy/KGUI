------------------------------------------------
-- �ļ���    :  ��_��������_��������.lua
-- ������    :  ����
-- ����ʱ��  :  2009-1-20
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  ������_��
-- ����Ч��  :  ��������ָdot������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{	


};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local bRetCode     	= false;
    local nRecipeLevel	= SkillRecipeLevel;
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
        "skill/��/����/���߼�ǿ1.lua", 			
        0
   );
	
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end


function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
    local player = GetPlayer(dwCharacterID)
    if not player then
    		return
    end
	local Num_Random = Random(1, 100)
	if Num_Random <= 15 then
		local nLevel = player.GetSkillLevel(190)
		if nLevel then
			local targetType, targetID = player.GetSkillTarget()
			if not targetID then
				return
			end
			if GetPlayer(targetID) then
				player.CastSkill(3037,nLevel,TARGET.PLAYER,targetID)
			end
			if GetNpc(targetID) then
				player.CastSkill(3037,nLevel,TARGET.NPC,targetID)
			end			
		end
	end		
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com