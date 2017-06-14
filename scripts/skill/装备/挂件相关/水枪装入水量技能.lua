---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/ˮǹװ��ˮ������.lua
-- ����ʱ��:	2015/7/1 2:11:50
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/װ��/�Ҽ����/ˮǹװ��ˮ������.lua",
		0
	);

	skill.SetPublicCoolDown(16);							-- ����CD 1.5��

	skill.SetNormalCoolDown(1, 870)
	--skill.SetCheckCoolDown(1, 870);							-- װˮ2�ְ�CD
	
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	
	if player.dwBackItemIndex ~= 13905 and player.dwBackItemIndex ~= 13906 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		return false
	end

	if not (player.nMoveState == MOVE_STATE.ON_FLOAT) then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 7472), 4)
		return false
	end
	
	if player.bFightState then
		return false
	end

	if player.bOnHorse then
		return false
	end

	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	--���ˮ��---------------------------------------
	local nValue_SHUILIANG = 0
	local nValue_buffid = 0
	for i = 9093, 9102 do
		local buff = player.GetBuff(i, 1)
		if buff then
			player.DelBuff(i, 1)
		end
	end
	
	if player.dwBackItemIndex == 13906 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		player.AddBuff(0, 99, 9097, 1)
		player.PlaySfx(139, 0, 0, 0)
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(7, 7471) .. 100 .. "", 4)
	--	player.ResetCD(870)
		return
	end

	if player.dwBackItemIndex == 13905 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		player.AddBuff(0, 99, 9102, 1)
		player.PlaySfx(139, 0, 0, 0)
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(7, 7471) .. 200 .. "", 4)
	--	player.ResetCD(870)
		return
	end
	--------------------------------------------------------------------------------------
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com