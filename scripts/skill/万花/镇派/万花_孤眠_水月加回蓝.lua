------------------------------------------------
-- �ļ���    :  ��_��Թ_�����AP1.lua
-- ������    :  zhanghao
-- ����ʱ��  :  2011-04-05
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  ������
-- ����Ч��  :  
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
        	"skill/��/����/��_����_ˮ�¼ӻ���.lua", 
        	0
    );

    return true
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
 if not IsPlayer(dwCharacterID) then
    return
 end
 local player = GetPlayer(dwCharacterID)
 	if player.GetSkillLevel(2639) == 1 then
 		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 5 / 100
  elseif player.GetSkillLevel(2639) == 2 then
 		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 10 / 100
  elseif player.GetSkillLevel(2639) == 3 then
 		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 15 / 100
 	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com