---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/��÷_����1.lua
-- ����ʱ��:	2015/12/6 15:55:36
-- �����û�:	FENGMENGJIE
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
	local dwSkillLevel = skill.dwLevel;
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/װ��/�Ҽ����/��÷_����1.lua",
		0
	);

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 1015);

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if player.dwBackItemIndex ~= 16872 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		return false
	end

	local buff = player.GetBuff(1575, 15)
	if buff then
		player.SendSystemMessage(GetEditorString(8, 917))
		return
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

	local scene = player.GetScene()

	if player.dwBackItemIndex ~= 16872 then
		return
	end

	if player.dwModelID ~= 0 then -- ����ǲ��ǻ�װ��
		return
	end

	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		return
	end

	if player.bFightState then
		return
	end

	if player.bOnHorse then
		return
	end

	local buff = player.GetBuff(1575, 15)
	if buff then
		player.SendSystemMessage(GetEditorString(8, 917))
		return
	end

	local doodad = nil
	local nX, nY
	if player.nRoleType == ROLE_TYPE.LITTLE_BOY then--��̫�ر���
		nX, nY = GetPosition(player.nX, player.nY, player.nFaceDirection, 40, 0)
	elseif player.nRoleType == ROLE_TYPE.STANDARD_MALE then
		nX, nY = GetPosition(player.nX, player.nY, player.nFaceDirection, 35, 0)
	else
		nX = player.nX
		nY = player.nY
	end

	local doodad_now = scene.GetDoodadByNickName("HeMeiZHUOZI_" .. player.dwID)
	if not doodad_now then
		doodad = scene.CreateDoodad(1728, nX, nY, player.nZ, player.nFaceDirection, "HeMeiZHUOZI_" .. player.dwID)
		if doodad then
			doodad.SetDisappearFrames(60 * GLOBAL.GAME_FPS, 0)
		end
	end

	player.DoAction(0, 13278) --����
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function GetPosition(nX, nY, nFaceDirection, nRadius, nRadian)
	local nRRadian = nRadian + (nFaceDirection / 256 * 2 * math.pi)
	local nX0 = nX + nRadius * math.cos(nRRadian)
	local nY0 = nY + nRadius * math.sin(nRRadian)
	return nX0, nY0
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com