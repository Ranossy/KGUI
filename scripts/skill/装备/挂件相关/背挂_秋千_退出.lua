---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/����_��ǧ_�˳�.lua
-- ����ʱ��:	2016/6/6 16:31:54
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
		"skill/װ��/�Ҽ����/����_��ǧ_�˳�.lua",
		0
	);

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 1027);

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
	if not scene then
		return
	end

	--------�����˳�-------
	local buff1 = player.GetBuff(10262, 1)
	if buff1 then
		local npc1 = scene.GetNpcByNickName("qq_fxf0520" .. player.dwID)
		if npc1 then
			local dwPlayer_fjID = npc1.GetPlayerIDBySocketIndex(1)
			if dwPlayer_fjID == nil then
				if player.GetDynamicSkillGroup() == 256 or player.GetDynamicSkillGroup() == 261 then
					player.SetDynamicSkillGroup(0)
				end
				
				player.DelBuff(10802, 1)

				npc1.SetPlayerToSocket(0, 0)
				player.DoAction(0, 10000)
				npc1.SetDisappearFrames(1, 0)

				if player.dwBackItemIndex == 17536 or player.dwBackItemIndex == 19241 then --������ʱ����жϴ���
					player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 335)
				end
			else
				local player_fj = GetPlayer(dwPlayer_fjID)
				if player_fj then
					if player_fj.GetDynamicSkillGroup() == 257 or player_fj.GetDynamicSkillGroup() == 258 then
						player_fj.SetDynamicSkillGroup(0)
					end

					if player.GetDynamicSkillGroup() == 256 or player.GetDynamicSkillGroup() == 261 then
						player.SetDynamicSkillGroup(0)
					end

					player.DelBuff(10802, 1)

					player_fj.DelBuff(10796, 1)
					player_fj.DelBuff(10802, 1)

					player.PlaySfx(1087, 0, 0, 0)
					npc1.SetPlayerToSocket(1, 0)
					npc1.SetPlayerToSocket(0, 0)

					player_fj.DoAction(0, 10000)
					player.DoAction(0, 10000)

					npc1.SetDisappearFrames(1, 0)

					if player.dwBackItemIndex == 17536 or player.dwBackItemIndex == 19241 then --������ʱ����жϴ���
						player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 335)
					end
				end
			end
		end
	end

	-------�����˳�---------
	local buff2 = player.GetBuff(10796, 1)
	if buff2 then
		local buff6 = player.GetBuff(10802, 1)
		if buff6 then
			local owner = GetPlayer(buff6.nCustomValue)
			local buff7 = owner.GetBuff(10262, 1)

			if buff7 then
				local npc2 = scene.GetNpcByNickName("qq_fxf0520" .. owner.dwID)
				if npc2 then
					player.DelBuff(10802, 1)
					player.DelBuff(10796, 1)
					if player.GetDynamicSkillGroup() == 257 or player.GetDynamicSkillGroup() == 258 then
						player.SetDynamicSkillGroup(0)
					end

					npc2.SetPlayerToSocket(1, 0)
					player.DoAction(0, 10000)
					buff7.nCustomValue = 0
					------------------------
				end
			end
		end
	end

	if player.GetDynamicSkillGroup() ~= 0 then
		player.SetDynamicSkillGroup(0)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com