---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/��ʿ_�л�_�Ӽ���_��ɢ����.lua
-- ����ʱ��:	2016/6/24 16:23:17
-- �����û�:	wangwei2
-- �ű�˵��:	15275
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/������̬/��ʿ/include/��ʿ_Data.lua")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/Quest/������̬/��ʿ_�л�_�Ӽ���_��ɢ����.lua",
		0
	);

	skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 10 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 6 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 6 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 10 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 25;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)
	return true;
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

-------������ܵ�����Ŀ�����ͷ��л꼼�ܵ���ҵ��Ŷӳ�Ա-------
function Apply(dwCharacterID, dwSkillSrcID)
	--print("��ɢ���ѣ�")
	local wizard = GetPlayer(dwSkillSrcID)
	if not wizard then
		--print("û��ʩ����")
		return
	end
	local player = GetPlayer(dwCharacterID)
	if not player then
		--print("û�ж���")
		return
	end
	--print(player.szName)
	local buff = player.GetBuff(10842, 1)   --��긽��BUFF
	if not buff then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local ghost = scene.GetNpcByNickName("Identity_Ghost" .. player.dwID)
	if not ghost then		
		return
	end
	local fazhen = scene.GetNpcByNickName("FaZhen" .. wizard.dwID)
	if not fazhen then
		return
	end
	if ghost.GetCustomInteger1(8) == 1 then
		return
	end
	if ghost.GetBuff(10957, 1) then
		return
	end
	Identity_LonelyGhostSummon_Prepair(fazhen, wizard, ghost)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com