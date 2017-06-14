------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-6-1
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
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
	local nRecipeLevel = SkillRecipeLevel;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
		"skill/�嶾/90����Ѩ/��ӰAOE.lua",				-- ����ֵ1
		0														-- ����ֵ2
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
function Apply(dwCharacterID, dwSrcID)
	local cPlayer = GetPlayer(dwSrcID)
	if not cPlayer then
		return
	end
	local tPlayer = GetPlayer(dwCharacterID)
	if tPlayer then
		if tPlayer.GetBuff(2307, 1) or tPlayer.GetBuff(10118, 1) then
			cPlayer.CastSkill(6631,1)
		end
	end
	local npc = GetNpc(dwCharacterID)
	if npc then
		if npc.GetBuff(2307, 1) or npc.GetBuff(10118, 1) then
			cPlayer.CastSkill(6631,1)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com