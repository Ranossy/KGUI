---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/�Ҽ�_��Ӱ����_��ɡ_����.lua
-- ����ʱ��:	2017/5/18 23:40:56
-- �����û�:	ZHANGYAN0-PC
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
		"skill/װ��/�Ҽ����/�Ҽ�_��Ӱ����_��ɡ_����.lua",
		0
	);

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 536);

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
	-- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
	
	if player.dwBackItemIndex ~= 19466 then
		return false
	end

	if player.GetBuff(11902, 0) then
		return false
	end
	
	--]]-----------------------------------------------------------------------------------------------
	if player.dwIdentityVisiableID ~= 0 then
		return SKILL_RESULT_CODE.FAILED
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
	if not CustomFunction.CheckPlayerForRepresentApply(player) then
		return
	end
	if not (player.nMoveState == MOVE_STATE.ON_STAND or player.nMoveState == MOVE_STATE.ON_WALK or player.nMoveState == MOVE_STATE.ON_RUN) then
		player.SendSystemMessage(GetEditorString(2, 8380))
		return
	end

	if player.GetBuff(1575, 0) then			--��ɡ�ʹ���ر�
		player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
		local buff_san = player.GetBuff(1575, 0)
		if buff_san then
			player.DelBuff(1575, buff_san.nLevel)
		end
	else
		--player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
		if player.GetSingleRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND) == 395 then
			player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 0)
		end
		
		player.DoAction(0, 13359)			--���ſ�ɡ����
		
		if player.nRoleType == ROLE_TYPE.STANDARD_MALE then
			player.AddBuff(0, 99, 1576, 17, 15)	--��ӿ�ɡ��ӳ�ɡ������Buff
		elseif player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
			player.AddBuff(0, 99, 1576, 17, 14)	--��ӿ�ɡ��ӳ�ɡ������Buff
		elseif player.nRoleType == ROLE_TYPE.LITTLE_BOY then
			player.AddBuff(0, 99, 1576, 17, 12)	--��ӿ�ɡ��ӳ�ɡ������Buff
		elseif player.nRoleType == ROLE_TYPE.LITTLE_GIRL then
			player.AddBuff(0, 99, 1576, 17, 18)	--��ӿ�ɡ��ӳ�ɡ������Buff
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com