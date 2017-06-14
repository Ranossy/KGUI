---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�����Ǳ�/��17037.lua
-- ����ʱ��:	2016/10/10 21:32:17
-- �����û�:	xutong3
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

--	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/Quest/�����Ǳ�/��17037.lua", -- ����ֵ1
		0											-- ����ֵ2
	);

	skill.AddSlowCheckSelfBuff(11419, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --������BUFF
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	skill.SetNormalCoolDown(1, 1156);	--������ͨCD
	return true;
end
function Apply(dwCharacterID, dwSkillSrcID)
	print(GetEditorString(10, 9142), dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player or player.GetMapID()  ~= 239 then
		return
	end
	local buff = player.GetBuff(11417, 1)
	if not buff then
		return
	end
	local npc = GetNpc(buff.nCustomValue)
	if not npc then
		return
	end
	npc.FireAIEvent(2007,1,1)
end
-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com