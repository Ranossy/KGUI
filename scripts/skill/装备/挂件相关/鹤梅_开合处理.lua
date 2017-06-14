---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/��÷_���ϴ���.lua
-- ����ʱ��:	2015/11/26 15:48:31
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
		"skill/װ��/�Ҽ����/��÷_���ϴ���.lua",
		0
	);

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 1014);

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
	if not (player.nMoveState == MOVE_STATE.ON_STAND or player.nMoveState == MOVE_STATE.ON_WALK or player.nMoveState == MOVE_STATE.ON_RUN) then
		player.SendSystemMessage(GetEditorString(2, 8380))
		return
	end

	if not CustomFunction.CheckPlayerForRepresentApply(player) then
		return
	end
	
	if player.GetSingleRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND) == 315 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 0)
	end

	if player.GetBuff(1575, 0) then			--��ɡ�ʹ���ر�
		player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
		local buff_san = player.GetBuff(1575, 0)
		if buff_san then
			player.DelBuff(1575, buff_san.nLevel)
		end
	else
		--local tBUFF_h = {		--�����������������buff, �ɾ�ϵͳ�����Buff
		--{1422, 1},
		--{1426, 1},
		--{1426, 2},
		--{1528, 1},
		--}
		--for i = 1, #tBUFF_h do
		--player.DelBuff(tBUFF_h[i][1], tBUFF_h[i][2])
		--end

		--player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff

		player.DoAction(0, 13298)			--���ſ�ɡ����
		player.AddBuff(0, 99, 1576, 15)	--��ӿ�ɡ��ӳ�ɡ������Buff
		--��̬���������
		player.AddBuff(0, 99, 10276, 1, 1000)
		player.SetDynamicSkillGroup(231)
		--��Ӷ�̬������
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com