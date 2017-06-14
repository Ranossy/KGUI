---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����й�_���±�Ժ/���±�Ժ_3��_��ɫ����.lua
-- ����ʱ��:	2015/6/2 10:10:40
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 14000, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 29300, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--[[skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);--]]

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/npc/����BOSS/�����й�_���±�Ժ/���±�Ժ_3��_��ɫ����.lua", --����ֵ1
		0															--����ֵ2
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	skill.AddSlowCheckDestBuff(8976, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ����Ŀ��Buff

	skill.AddSlowCheckDestBuff(8982, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ����Ŀ��Buff
	skill.AddSlowCheckDestBuff(8979, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ����Ŀ��Buff
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(1, 555, 1);						-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetPublicCoolDown(16);
	--skill.SetCheckCoolDown(1, 444);

	----------------- ����������� ---------------------------------------------
	--skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�����
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(1, 1, 13863, 1)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 3;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0;					-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 99 * LENGTH_BASE;					-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 99 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 25;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinChannelInterval = 1;-- ͨ�������ʱ��
	--skill.nChannelInterval = 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame = 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- ���߼������ -------------------------------------------------
	skill.nTargetRayTargetType = 2; --���Ŀ��Ϊnpc��player
	skill.nTargetRayWidth = 192; --������
	skill.nHeight = 480;

	----------------- ������ -------------------------------------------------
	--skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSrcID)
	local npctarget = GetNpc(dwCharacterID)
	local npcboss = GetNpc(dwSrcID)
	local scene
	if npcboss then
		scene = npcboss.GetScene()
	end
	
	if scene.dwMapID == 221 then
		if npctarget and npctarget.dwTemplateID == 43275 then
			--local scene = npctarget.GetScene()
			local duoduo = scene.GetNpcByNickName("libaideduoduo")
			if duoduo then
				duoduo.SetCustomInteger1(2, 1)---������ϳɾ�
			end
			if not npctarget.GetBuff(8974, 1) then
				npctarget.AddBuff(0, 99, 8972, 1, 30)
				npctarget.AddBuff(0, 99, 8974, 1)
			end
		end
	
		if npctarget and npctarget.dwTemplateID ~= 43275 then
			npctarget.Die()
			--local scene = npctarget.GetScene()
			npctarget.AddBuff(0, 99, 8977, 1)
			if not npctarget.GetBuff(8974, 1) then
				npctarget.AddBuff(0, 99, 8975, 1, 10)
				npctarget.AddBuff(0, 99, 8974, 1)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 1, TARGET.NPC, npctarget.dwID)
					end
				end
			end
		end
		
		local player = GetPlayer(dwCharacterID)
		if player then
			--local scene = player.GetScene()
			player.AddBuff(0, 99, 8977, 1)
			if not player.GetBuff(8974, 1) then
				player.AddBuff(0, 99, 8975, 1, 10)
				player.AddBuff(0, 99, 8974, 1)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 1, TARGET.PLAYER, player.dwID)
					end
				end
			end
		end
	end

	if scene.dwMapID == 230 then
		if npctarget and npctarget.dwTemplateID == 47097 then
			--local scene = npctarget.GetScene()
			local duoduo = scene.GetNpcByNickName("libaideduoduo")
			if duoduo then
				duoduo.SetCustomInteger1(2, 1)---������ϳɾ�
			end
			if not npctarget.GetBuff(8974, 2) then
				npctarget.AddBuff(0, 99, 8972, 2, 30)
				npctarget.AddBuff(0, 99, 8974, 2)
			end
		end
	
		if npctarget and npctarget.dwTemplateID ~= 47097 then
			npctarget.Die()
			--local scene = npctarget.GetScene()
			npctarget.AddBuff(0, 99, 8977, 2)
			if not npctarget.GetBuff(8974, 2) then
				npctarget.AddBuff(0, 99, 8975, 2, 10)
				npctarget.AddBuff(0, 99, 8974, 2)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 2, TARGET.NPC, npctarget.dwID)
					end
				end
			end
		end
		
		local player = GetPlayer(dwCharacterID)
		if player then
			--local scene = player.GetScene()
			player.AddBuff(0, 99, 8977, 2)
			if not player.GetBuff(8974, 2) then
				player.AddBuff(0, 99, 8975, 2, 10)
				player.AddBuff(0, 99, 8974, 2)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 2, TARGET.PLAYER, player.dwID)
					end
				end
			end
		end
	end

	if scene.dwMapID == 233 then
		if npctarget and npctarget.dwTemplateID == 47633 then
			--local scene = npctarget.GetScene()
			local duoduo = scene.GetNpcByNickName("libaideduoduo")
			if duoduo then
				duoduo.SetCustomInteger1(2, 1)---������ϳɾ�
			end
			if not npctarget.GetBuff(8974, 2) then
				npctarget.AddBuff(0, 99, 8972, 2, 30)
				npctarget.AddBuff(0, 99, 8974, 2)
			end
		end
	
		if npctarget and npctarget.dwTemplateID ~= 47633 then
			npctarget.Die()
			--local scene = npctarget.GetScene()
			npctarget.AddBuff(0, 99, 8977, 2)
			if not npctarget.GetBuff(8974, 2) then
				npctarget.AddBuff(0, 99, 8975, 2, 10)
				npctarget.AddBuff(0, 99, 8974, 2)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 or scene.dwMapID ~= 230 or scene.dwMapID ~= 233 then
						--npc.CastSkill(14296, 2, TARGET.NPC, npctarget.dwID)
					end
				end
			end
		end
		
		local player = GetPlayer(dwCharacterID)
		if player then
			--local scene = player.GetScene()
			player.AddBuff(0, 99, 8977, 2)
			if not player.GetBuff(8974, 2) then
				player.AddBuff(0, 99, 8975, 2, 10)
				player.AddBuff(0, 99, 8974, 2)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 2, TARGET.PLAYER, player.dwID)
					end
				end
			end
		end
	end

	if scene.dwMapID == 235 then
		if npctarget and npctarget.dwTemplateID == 48214 then
			--local scene = npctarget.GetScene()
			local duoduo = scene.GetNpcByNickName("libaideduoduo")
			if duoduo then
				duoduo.SetCustomInteger1(2, 1)---������ϳɾ�
			end
			if not npctarget.GetBuff(8974, 3) then
				npctarget.AddBuff(0, 99, 8972, 3, 30)
				npctarget.AddBuff(0, 99, 8974, 3)
			end
		end
	
		if npctarget and npctarget.dwTemplateID ~= 48214 then
			npctarget.Die()
			--local scene = npctarget.GetScene()
			npctarget.AddBuff(0, 99, 8977, 3)
			if not npctarget.GetBuff(8974, 3) then
				npctarget.AddBuff(0, 99, 8975, 3, 10)
				npctarget.AddBuff(0, 99, 8974, 3)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 1, TARGET.NPC, npctarget.dwID)
					end
				end
			end
		end
		
		local player = GetPlayer(dwCharacterID)
		if player then
			--local scene = player.GetScene()
			player.AddBuff(0, 99, 8977, 3)
			if not player.GetBuff(8974, 3) then
				player.AddBuff(0, 99, 8975, 3, 10)
				player.AddBuff(0, 99, 8974, 3)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 1, TARGET.PLAYER, player.dwID)
					end
				end
			end
		end
	end

	if scene.dwMapID == 237 then
		if npctarget and npctarget.dwTemplateID == 48680 then
			--local scene = npctarget.GetScene()
			local duoduo = scene.GetNpcByNickName("libaideduoduo")
			if duoduo then
				duoduo.SetCustomInteger1(2, 1)---������ϳɾ�
			end
			if not npctarget.GetBuff(8974, 4) then
				npctarget.AddBuff(0, 99, 8972, 4, 30)
				npctarget.AddBuff(0, 99, 8974, 4)
			end
		end
	
		if npctarget and npctarget.dwTemplateID ~= 48680 then
			npctarget.Die()
			--local scene = npctarget.GetScene()
			npctarget.AddBuff(0, 99, 8977, 4)
			if not npctarget.GetBuff(8974, 4) then
				npctarget.AddBuff(0, 99, 8975, 4, 10)
				npctarget.AddBuff(0, 99, 8974, 4)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 1, TARGET.NPC, npctarget.dwID)
					end
				end
			end
		end
		
		local player = GetPlayer(dwCharacterID)
		if player then
			--local scene = player.GetScene()
			player.AddBuff(0, 99, 8977, 4)
			if not player.GetBuff(8974, 4) then
				player.AddBuff(0, 99, 8975, 4, 10)
				player.AddBuff(0, 99, 8974, 4)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 1, TARGET.PLAYER, player.dwID)
					end
				end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com